# Tacotron-1 with KSS Datasets

TensorFlow implementation of:

- [Deep Voice 2: Multi-Speaker Neural Text-to-Speech](https://arxiv.org/abs/1705.08947)
- [Listening while Speaking: Speech Chain by Deep Learning](https://arxiv.org/abs/1707.04879)
- [Tacotron: Towards End-to-End Speech Synthesis](https://arxiv.org/abs/1703.10135)

![model](./assets/model.png)


## Prerequisites

- Python 3.6+
- FFmpeg
- [Tensorflow 1.3](https://www.tensorflow.org/install/)

## Usage

### 1. Install prerequisites

After preparing [Tensorflow](https://www.tensorflow.org/install/), install prerequisites with:

    pip3 install -r requirements.txt
    python -c "import nltk; nltk.download('punkt')"

### 2-1. Download KSS datasets

The `kss datasets` directory should look like:

(Download link : https://drive.google.com/open?id=166Gjf1BBCjFFSAGRCmnPIXIWCwWJ5Q6u)

    $(kss_data_path)
        ├── metadata.csv
        └── 1
            ├── 1_0000.wav
            ├── 1_0001.wav
            ├── 1_0002.wav
            └── ...
        ├── 2
        ├── 3
        └── 4
	
### 2-2. Prepare train datasets

Modify KSS datasets path in ./datasets/kss/prepare.py

    dataset_dir = "$(kss_data_path)"

You can generate alignment json file with :

    python -m datasets.kss.prepare 

The `datasets` directory should look like:

    datasets
    ├── kss
        ├── alignment.json

and `kss/alignment.json` should look like:

    {
	    "$(kss_data_path)/1/1_0000.wav": [
		"그는 괜찮은 척하려고 애쓰는 것 같았다."
	    ],
	    "$(kss_data_path)/1/1_0001.wav": [
		"그녀의 사랑을 얻기 위해 애썼지만 헛수고였다."
	    ],
	    "$(kss_data_path)/1/1_0002.wav": [
		"용돈을 아껴 써라."
	    ],
    }
    
    
### 2-3. Generate train datasets

    python3 -m datasets.generate_data ./datasets/kss/alignment.json

    datasets
    ├── kss
        ├── alignment.json
        └── data
            ├── 1_0000.npz
            ├── 1_0001.npz
            ├── 1_0002.npz
            └── ...


### 3. Train a model

The important hyperparameters for a models are defined in `hparams.py`.

(**Change `cleaners` in `hparams.py` from `korean_cleaners` to `english_cleaners` to train with English dataset**)

    python train.py --data_path=datasets/kss \
	 --summary_interval=1000 \
	 --test_interval=1000 \
	 --checkpoint_interval=1000 \
	 --skip_path_filter=True \
	 --num_test_per_speaker=2

To restart a training from previous experiments such as `logs/kss_2018-08-28_23-46-20`:

    python train.py --data_path=datasets/kss \
	 --summary_interval=1000 \
	 --test_interval=1000 \
	 --checkpoint_interval=1000 \
	 --skip_path_filter=True \
	 --num_test_per_speaker=2 \
	 --load_path=logs/kss_2018-08-28_23-46-20
 

### 4. Synthesize audio

You can train your own models with:

    python synthesizer.py --load_path=logs/kss_2018-08-28_23-46-20 --text "이거 실화냐?" --is_korean=True
	
	
### 5. Realtime Audio synthesize

You can train your own models with:

    python app.py --load_path='logs/kss_2018-08-28_23-46-20' --is_korean=True	


## References

- [Keith Ito](https://github.com/keithito)'s [tacotron](https://github.com/keithito/tacotron)
- [DEVIEW 2017 presentation](https://www.slideshare.net/carpedm20/deview-2017-80824162)
