cd /home/1u5t1n14n/.cache/
if [! -d sidebar/ ]
then
  git init sidebar
  cd sidebar
  git remote add -f origin https://github.com/aminought/firefox-second-sidebar

  git config core.sparseCheckout true

  echo "src/" >> .git/info/sparse-checkout
fi

git pull origin master
if [! -d /home/1u5t1n14n/.mozilla/firefox/Firefox/chrome/JS/ ]
then
  mkdir -p /home/1u5t1n14n/.mozilla/firefox/Firefox/chrome/JS/
fi

rm -rf /home/1u5t1n14n/.mozilla/firefox/Firefox/chrome/JS/*
mv src/* /home/1u5t1n14n/.mozilla/firefox/Firefox/chrome/JS/

cd ..
