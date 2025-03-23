install all the required packesgs
- docker = sudp apt install docker.io -y 
- anisble = https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-20-04
- k8s = https://github.com/Balunideepak/Deployment-script.git
- jenkins = https://github.com/Balunideepak/Deployment-script.git
  ===========================
  
_________________________________________________________________________________________________________________________________
  After login in Jenkins :
___________________________________________________________________________________________
Add credintials :- 
  - docker hub login ( make sure your ID match the id in jenkinsfile)
  - ssh key (make sure your ID match the id in jenkinsfile)
 ___________________________________________________________________________________________________
 Add tools :-
 - the environment variable you set in ec2 machine.
 - like JAVA_HOME, M2_HOME , ANSIBLE
____________________________________________________________________________________________________
* install plugins : docker, pipeline, prometheus,html publisher, 
________________________________________________________________________________________________
* build item :-
    - slelect git  --> add repository https://github.com/Balunideepak/healthcare-project.git   --> select deepjenkinsfile --> save --> build now.
_____________________________________________________________________________________
* in master node run folling command.
  - kubectkl get pods -o wide
  - kubectl  get svc -o wide
______________________________________________________________________________________
* copy the <Public IP of the node machine: NodePort no which you got in "kubectl  get svc -o wide" command> and see you websit is working.
______________________________________________________________________________________________________________________________A  
