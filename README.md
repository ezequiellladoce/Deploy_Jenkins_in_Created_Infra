# Module_Basics_2

en la carpeta Module_Basics_2/Configure_Basic_infra

echo "[jenkins_server]" > /etc/ansible/hosts
terraform output pub_ip >> /etc/ansible/hosts

verificamos que este grabado

aws secretsmanager get-secret-value --secret-id "ec2-key-1" --region "us-east-2" --query 'SecretString' --output text > key.pem
chmod 400 key.pem
cat key.pem

ansible all -m ping -u ec2-user --key-file key.pem
