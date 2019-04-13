# Mac Setup Notes
*Walkthrough with detailed instructions on setting up my preferred personal environment (the steps can be followed sequentially)*

### UI Config
* Remove all apps from dock except:
  * Finder and Trash
  * Chrome, Atom, Slack, Terminal and Quicksilver will be added later
* Change touch pad options: enable only tap and natural scroll to click on touch pad
* Limit spotlight results to only applications
* Setup keyboard customize control strip with screen lock in keyboard - customize touch bar
* Change finder sidebar to only:
  * Documents, Desktop, Downloads and Applications
* Delete unnecessary apps:
  * Garage Band, iMovies, Keynote, Numbers, Pages

### Install Applications (via Chrome)
* Chrome
* Atom
* Slack
* Docker
* Postman
* 1Password
* Viscosity
* R


* Spectacles
* Caffeine
* Quicksilver

### Applications Config
* Change Terminal appearance to Homebrew
* Remove touch pad controls via View top menu for: Chrome, Terminal
* Install necessary Atom packages:
  * atom-html-preview, atom-ide-ui, autocomplete-python, go-plus, go-signature-statusbar, ide-go, ide-typescript, language-docker, language-ini, language-jenkinsfile, language-markdown, language-proto, language-restructuredtext, language-terraform, language-x86asm, pdf-view, pretty-json, remember-folds
* Install custom versions of Atom packages:
  * apm install https://github.com/mfripp/atom-tablr.git

### System Config
* Clone config directory from GitHub and link files (update templates after cloning public repo)
  * ` cd $HOME/Documents && git clone https://github.com/uncmath25/Personal_Config.git && mv Personal_Config Config && cd Config && ./_mac_link_configs.sh `
* Setup Homebrew and install packages
  * ` /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" `
  * ` brew install mysql postgres htop python3 npm golang gcc dep nmap telnet tree flake8 `
  * ` xcode-select --install `
  * Note: brew installs in */Cellar* and then symlinks to */usr/local*
* Instal python packages
  * ` pip3 install awscli jupyter jupyterlab virtualenv django Flask pytest pytest-cov `
  * ` pip3 install boto3 snowflake snowflake-connector_python apache-airflow SQLAlchemy `
  * ` pip3 install numpy pandas sklearn statsmodels matplotlib pymysql pygame requests seaborn langdetect bs4 `
  * ` pip3 install nltk `
  * ` python -c "import nltk; nltk.download('stopwords'); nltk.download('punkt')" `
  * ` sudo jupyter labextension install @jupyterlab/vega4-extension `
* Install npm packages
  * ` npm install -g pm2 serverless http-server json-server `

### Optional System Config
* If necessary, install pyspark with appropriate java version
  * ` brew cask install homebrew/cask-versions/java8 `
  * ` pip3 install pyspark==2.3.2 `
  * Note: purge java 11 as it's incompatible with Spark
* Allow go Bitbucket to work with private repos over ssh:
  * ` git config --global url."git@bitbucket.org:".insteadOf "https://bitbucket.org/" --save `
