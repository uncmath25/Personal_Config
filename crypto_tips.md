# Cryptography Tips

### SSH Keys
* Create new ssh key
  ```
  ssh-keygen -P "" -f ~/.ssh/FILE.pem
  chmod 600 ~/.ssh/FILE.pem
  ```
* Generate public key from private key
  ```
  ssh-keygen -y -f ~/.ssh/FILE.pem > ~/.ssh/FILE.pem.pub
  ```
