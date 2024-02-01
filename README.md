# taxidata

create a VM instance using GCP
steps
generate ssh public key in ubuntu terminal
$cd .ssh
$ssh-keygen -t rsa -f gcp -C shiva -b 2048  -- type rsa, file name gcp(it generates 2 public and private keys) 

In GCP add public ssh key generated to the VM instance meta data so this can be accessed from that instance.
Create a GCP vm instance with ubuntu image and 20/30 gb storage.

Now from local terminal lets coinnect to remote instance using ssh
$cd
$ssh -i .ssh/gcp shiva@externalip   (generate identity file in .ssh access private key generated and username@external ip from the VM)

install anaconda 
$wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh
$bash Anaconda3-2023.09-0-Linux-x86_64.sh

$cd .ssh
create a config file in the .ssh 
$cd ..
$ssh gcp (gcp is the host) using this we can login and logout of the vm


$sudo apt install docker
$sudo gpasswd -a $USER docker
$sudo service docker restart
$logout
$ssh gcp

$mkdir bin
$wget https://github.com/docker/compose/releases/download/v2.24.3/docker-compose-linux-x86_64 -o docker-compose
$chmod +x docker-compose

$cd ..
$nano .bashrc( to add docker compose to the path)
in the file add 
export PATH="${HOME}/bin:${PATH}"
ctrl+o and ctrl+x

$source .bashrc


GIT:
generate rsa key and add that into github to have connection
next create a rep in github
clone rep using https in password provide personal access token generated in git hub to have handshake mech
create a branching strategy
checkout to the brach then perform actions
$git add fn
$git status
$git commit -m ""
$git push (based on branch strategy)
$git merge

next checkout to week1
$docker-checkout up -d (detach mode) {creates postgres and pgadmin env as per yaml file}

In VS code connect to the remote and from there forward the ports 8080 and 5432
connect to pgadmin using host as docker image name($docker ps) and username and password of postgres image(root/root)


URL="https://github.com/DataTalksClub/nyc-tlc-data/releases/download/yellow/yellow_tripdata_2021-01.csv.gz"
python ingest_data.py \
  --user=root \
  --password=root \
  --host=localhost \
  --port=5432 \
  --db=ny_taxi \
  --table_name=yellow_taxi_trips \
  --url=${URL}

$pip install psycopg2-binary


Terraform:
$cd bin
$wget https://releases.hashicorp.com/terraform/1.7.1/terraform_1.7.1_linux_amd64.zip
$sudo apt install unzip
$unzip terr*.zip
$cd ..

move service account json file to .gc folder using sftp(in IAM and admin go to service account and download a json key)
$mkdir .gc   (in week1/taxidata rep)
$cd .gc
$put ny_data.json

$export GOOGLE_APPLICATION_CREDENTIALS=${PWD}/.gc/ny_data.json
(base) shiva@ubuntuvm:~/taxidata$ gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS

$terraform init
$terraform plan
$terraform apply
