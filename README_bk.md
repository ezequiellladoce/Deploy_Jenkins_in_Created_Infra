# Module_Basics_2


en la carpeta Module_Basics_2/Configure_Basic_infra/output_ip

echo "[jenkins_server]" > /etc/ansible/hosts
terraform output pub_ip >> /etc/ansible/hosts

verificamos que este grabado

en root@ip-172-31-46-215:/home/ubuntu/Module_Basics_2/03_Configure_Basic_infra/Ansible#

aws secretsmanager get-secret-value --secret-id "ec2-key-c" --region "us-east-2" --query 'SecretString' --output text > key.pem
chmod 400 key.pem
cat key.pem

ansible all -m ping -u ubuntu --key-file key.pem

ansible-playbook Ansible/playbook.yml -u ubuntu --key-file key.pem

/home/ubuntu/Module_Basics_2/Configure_Basic_infra# ansible-playbook Ansible/playbook.yml -u ubuntu --key-file key.pem

Falta instalar Ansible
