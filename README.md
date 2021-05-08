# Module_Basics_2

echo "[jenkins_server]" > /etc/ansible/hosts
terraform output public_ip >> /etc/ansible/hosts

aws secretsmanager get-secret-value --secret-id "EC2-key-4" --region "us-east-2" --query 'SecretString' --output text > key.pem
chmod 400 key.pem
cat key.pem

ansible all -m ping -u ec2-user --key-file key.pem
