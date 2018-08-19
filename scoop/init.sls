set appropraite exeuction mode:
  cmd.run:
    - shell: 'powershell'
    - name: 'Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force'
  chocolatey.uninstalled:
    - name: 'minikube'
    - uninstall_args: '-a -y --force'

# {% set user_profile = salt['environ.get']('USERPROFILE') %}
Run and install scoop:
  cmd.run:
    - shell: 'powershell'
    - name: 'iex (new-object net.webclient).downloadstring("https://get.scoop.sh")'
    - unless:
      - 'ls {{ user_profile }}/scoop'


# {% set current_path = salt['environ.get']('PATH', '/bin:/usr/bin') %}
Add scoop extras:
  cmd.run:
    - shell: 'powershell'
    - prepend_path: '{{ user_profile }}\scoop\shims'
    - name: 'scoop bucket add extras'
    - env:
      - PATH:  '{{ [current_path, "{0}\\scoop\shims".format(user_profile)]|join(";") }}'
    - unless:
      - 'ls {{ user_profile }}/scoop/buckets/extras'

Add scoop binaries required 'jq, minikube, kubectl, helm':
  cmd.run:
    - prepend_path: '{{ user_profile }}\scoop\shims'
    - shell: 'powershell'
    - name: 'scoop install jq minikube kubectl helm'
    - env:
       - PATH:  '{{ [current_path, "{0}\\scoop\shims".format(user_profile)]|join(";") }}'

