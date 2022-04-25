python3 -m venv venv

source venv/bin/activate

pip install "python-dotenv[cli]"

dotenv run terraform plan -out tfplan

dotenv run terraform apply -auto-approve
