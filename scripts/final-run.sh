BASE_PATH="/content/"

cd -- "$BASE_PATH"
git clone https://github.com/blockchain-cte/KeyClass-singleclass.git
mv KeyClass-singleclass KeyClass
pip install snorkel transformers==4.11.3 sentence-transformers cleantext pyhealth gdown
cd KeyClass/scripts/

mkdir data/
cd data/
FILE_ID="1TTJHzsBFJLFwqALQXUpzsOke7sF3foGc"
URL="https://docs.google.com/uc?export=download&id=$FILE_ID"
echo ${green}===Downloading MIMIC Data...===${reset}
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate $URL -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$FILE_ID" -O "mimic.zip" && rm -rf /tmp/cookies.txt
echo ${green}===Unzipping MIMIC Data...===${reset}
jar xvf mimic.zip && rm mimic.zip
mv smallmimic-singleclass mimic

cd -- "$BASE_PATH"
cd KeyClass/scripts/
CONFIG_LOCATION="${BASE_PATH}KeyClass/config_files/config_mimic.yaml"
echo $RUN_ALL_SCRIPT_LOCATION
echo $CONFIG_LOCATION
python run_all.py --config $CONFIG_LOCATION