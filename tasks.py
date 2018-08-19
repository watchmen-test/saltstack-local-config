from invoke import task
import shutil, os

@task(help={"hyperv-switch": "nat switch to use default is set to 'natswitch'"})
def start_minikube(c, hyperv_switch='NATSwitch'):
    '''
    This will start the minikube instance with the correct params

    CLI Example:
        inv start-minikube --hyperv-switch 'NATSwitch'
        inv start-minikube
    '''
    cmd = 'minikube start --vm-driver=hyperv --hyperv-virtual-switch={0} --kubernetes-version=v1.9.0 --bootstrapper=localkube'.format(hyperv_switch)
    c.run(cmd)


@task
def delete_minikube(c):
    '''
    This deletes the minikube instance that is started. 

    CLI Example:
        inv delete-minikube
    '''
    cmd = 'minikube stop && minikube delete'
    c.run(cmd)

@task
def reprovision(c):
    '''
    This will run the salt scripts on this machine

    CLI Example:
        inv reprovision
    '''
    os.environ["EXECUTION_PATH"] = os.path.dirname(os.path.realpath(__file__))
    cmd = 'C:/salt/salt-call.bat --local state.highstate'
    c.run(cmd)