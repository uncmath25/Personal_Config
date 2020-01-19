# Linux Mint 19.3 Tricia Setup

### Install Core Software
* Chrome
  * Pin to toolbar
  * Sign into 1Password with secret key for first time
  * Login into Google - loads toolbar and Ghostery
* Atom
  * Pin to toolbar
  * Setup home project - Content, go, Downloads, Desktop (CodeCommit is second project)
  * Install packages
  ```
  apm install \
      atom-html-preview \
      atom-ide-ui \
      autocomplete-python \
      go-plus \
      go-signature-statusbar \
      ide-go \
      ide-typescript \
      language-docker \
      language-ini \
      language-jenkinsfile \
      language-markdown \
      language-proto \
      language-restructuredtext \
      language-scala \
      language-terraform \
      language-x86asm \
      pdf-view \
      pretty-json
  ```
* Docker
  * Install the packages and add your user to the Docker group
  ```
  sudo apt-get -y install docker.io docker-compose
  sudo usermod -aG docker $USER
  ```
  * Add the following dns entries to /etc/systemd/resolved.conf
  (This solved intermittent networking issues for the Docker daemon)
  ```
  DNS=8.8.8.8 8.8.4.4
  ```
  * Reboot
* Steam
  * Disable GPU accelerated rendering under Settings/Interface
* Extras
  ```
  sudo apt install -y \
    awscli \
    curl \
    git \
    go-dep \
    htop \
    flake8 \
    golang \
    jq \
    mysql-client \
    nmap \
    npm \
    postgresql \
    postgresql-contrib \
    sbt \
    scala \
    tree
  echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
  curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | sudo apt-key add
  sudo apt-get update
  sudo apt-get install sbt
  ```

### Setup Home Directory Structure
* Add: Applications, CodeCommit, Content, Desktop, Documents, go
* Remove: Music, Pictures, Templates, Videos
* Clone Github Repos
  ```
  cd ~/Content/coding_projects && git clone https://github.com/uncmath25/REPO
  ```

### Setup Bash Aliases
* Append the following config to ~/.bashrc
  ```
  # General Aliases
  alias ll="ls -alh"
  alias python="python3"
  alias python2="python2.7"
  alias py="python"
  alias dk="docker"
  alias mk="make"
  # Git shortcuts
  alias gita="git add"
  alias gitau="git add -u"
  alias gitc="git commit"
  alias gitca="git commit --amend"
  alias gitcm="git commit -m"
  alias gits="git status"
  alias gitb="git branch"
  alias gitl="git log --graph --decorate --pretty=oneline --abbrev-commit -20"
  alias gitp="git push"
  alias gitpf="git push -f"
  # Docker shortcuts
  alias dkp="dk ps -a"
  # Path Additions
  PATH="$HOME/.local/bin":$PATH
  # Environmental Variable
  export GOPATH="$HOME/go"
  export PYSPARK_PYTHON="python3"
  ```

### Setup SSH Access to VPS
* Write ssh config in ~/.ssh/config for "testing-lab" profile
  ```
  KeepAlive yes
  ServerAliveInterval 100
  ServerAliveCountMax 100

  Host testing-lab
    HostName VPS_IP
    User colton
    IdentityFile ~/.ssh/colton.pem
    LocalForward 3310 localhost:3306
  ```
* Add ssh private key to ~/.ssh/colton.pem
* Clone private repos
  ```
  cd ~/Content && git clone testing-lab:/home/colton/git/REPO
  ```
* Update git remote url in order to push repos back to Github
  ```
  git remote set-url origin git@github.com:uncmath25/$(basename $(pwd)).git
  ```
* Add the following ssh config entry to access Github
  (assuming colton.pem added as ssh key to Github)
  ```
  Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/colton.pem
  ```

### Setup AWS Access
* Add CLI credentials to ~/.aws/credentials
  ```
  [meme]
  output=json
  region=us-east-1
  aws_access_key_id = KEY_ID
  aws_secret_access_key = SECRET
  ```
* Use ssh access for CodeCommit - keys managed under IAM User
* Add the following ssh config entry
  ```
  Host aws
    HostName git-codecommit.us-east-1.amazonaws.com
    User SSH_ACCESS_KEY_ID
    IdentityFile ~/.ssh/KEY.pem
  ```
* Test the ssh aws config
  ```
  ssh aws
  # Should return "You have successfully authenticated over SSH"
  ```
* Clone the repos using the ssh config
  ```
  git clone aws:/v1/repos/REPO
  ```

### Setup Go
* Install golang and package manager
  ```
  sudo apt install -y go-dep golang
  ```
* Ensure that GOPATH is set (handled in above bash profile)
* Clone Github repos with "go get"
  ```
  go get github.com/uncmath25/go-microservice-template
  ```
* Develop within repos in the GOPATH - ~/go/src/github.com/uncmath25/REPO

### Setup Python
* Install pip
  ```
  sudo apt install -y python3-pip
  ```
* Setup pip
  ```
  sudo apt-get install -y build-essential libssl-dev python3-dev
  pip3 install wheel
  ```
* Install main packages
  ```
  pip3 install \
    apache-airflow \
    boto3 \
    bs4 \
    django \
    Flask \
    keras \
    langdetect \
    matplotlib \
    nltk \
    numpy \
    pandas \
    pygame \
    pymysql \
    pytest \
    pytest-cov \
    requests \
    seaborn \
    setuptools \
    sklearn \
    snowflake \
    snowflake-connector_python \
    SQLAlchemy \
    statsmodels \
    tensorflow \
    virtualenv
  ```
* Setup Jupyter
  ```
  pip3 install jupyter jupyterlab
  # Ensure that ~/.local/bin is added to your PATH - PATH="$HOME/.local/bin":$PATH
  ```
* Download extras
  ```
  python3 -c "import nltk; nltk.download('stopwords'); nltk.download('punkt')"
  ```

### Setup Spark
* Install Java8
  ```
  # purge java-11 if installed - sudo apt-get purge openjdk-\* openjre-\* icedtea-\* icedtea6-\*
  sudo apt install -y openjdk-8-jdk-headless
  java -version
  javac -version
  jar -version
  ```
* Install PySpark
  ```
  pip3 install pyspark
  ```

### Setup R
* Install core
  ```
  sudo apt-get install -y r-base r-base-core
  ```
* Change R library permission
  ```
  sudo chmod o+w /usr/local/lib/R/site-library
  ```
* Install libraries
  ```
  install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'uuid', 'digest'))
  ```
* --- REST IS SKIPPED FOR NOW BC APT UNINSTALLS NPM ---
* Setup devtools
  ```
  sudo apt-get install libcurl4-openssl-dev libssl-dev
  install.packages(c('devtools'))
  ```
* Install extra libraries
  ```
  install_github('IRkernel/IRkernel')
  IRkernel::installspec()
  ```

### Misc
* Install npm packages
  ```
  sudo npm install -g pm2 serverless
  ```
* Update the File Explorer hotlinks - remove unused home folders
* Add nano config to ~/.nanorc
  ```
  set tabsize 4
  set tabstospaces
  ```
* Ensure that mysql server is not running
  ```
  sudo systemctl disable mysql
  ```
* Consider removing unnecessary default software
* Cleanup apt packages
  ```
  sudo apt autoremove -y
  ```
