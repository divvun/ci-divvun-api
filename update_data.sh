set -e
git clone https://github.com/divvun/divvun-ci-config || true
cd divvun-ci-config

sh ./repo/scripts/download_speller.sh https://apertium.projectjj.com/apt/nightly/pool/main/g/giella-sme/ usr/share/voikko/4/se.zcheck se.zcheck
sh ./repo/scripts/download_speller.sh https://apertium.projectjj.com/apt/nightly/pool/main/g/giella-sme/ usr/share/giella/mobilespellers/se-mobile.zhfst se.zhfst

sh ./repo/scripts/download_speller.sh https://apertium.projectjj.com/apt/nightly/pool/main/g/giella-sma/ usr/share/voikko/4/sma.zcheck sma.zcheck
sh ./repo/scripts/download_speller.sh https://apertium.projectjj.com/apt/nightly/pool/main/g/giella-sma/ usr/share/giella/mobilespellers/sma-mobile.zhfst sma.zhfst

sh ./repo/scripts/download_speller.sh https://apertium.projectjj.com/apt/nightly/pool/main/g/giella-smn/ usr/share/voikko/4/smn.zcheck smn.zcheck
sh ./repo/scripts/download_speller.sh https://apertium.projectjj.com/apt/nightly/pool/main/g/giella-smn/ usr/share/giella/mobilespellers/smn-mobile.zhfst smn.zhfst

sh ./repo/scripts/download_speller.sh https://apertium.projectjj.com/apt/nightly/pool/main/g/giella-sms/ usr/share/voikko/4/sms.zcheck sms.zcheck
sh ./repo/scripts/download_speller.sh https://apertium.projectjj.com/apt/nightly/pool/main/g/giella-sms/ usr/share/giella/mobilespellers/sms-mobile.zhfst sms.zhfst

sh ./repo/scripts/download_speller.sh https://apertium.projectjj.com/apt/nightly/pool/main/g/giella-smj/ usr/share/voikko/4/smj.zcheck smj.zcheck
sh ./repo/scripts/download_speller.sh https://apertium.projectjj.com/apt/nightly/pool/main/g/giella-smj/ usr/share/giella/mobilespellers/smj-mobile.zhfst smj.zhfst

mv -f *.zcheck /home/api/dist/data/grammar/
mv -f *.zhfst /home/api/dist/data/spelling/
chown -R api:api /home/api/dist/data/
