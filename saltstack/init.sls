# {% set user_name = "{0}\\{1}".format(salt['environ.get']('USERDOMAIN'), salt['environ.get']('USERNAME')) %}
# {% set execution_path = salt['environ.get']('EXECUTION_PATH') %}
stop the salt-minion service:
  environ.setenv:
    - name: EXECUTION_PATH
    - value: '{{ execution_path }}'
    - permanent: 'HKCU'
  service.dead:
    - name: salt-minion
  win_dacl.present:
    - name: 'C:/salt'
    - objectType: 'Directory'
    - user: '{{ user_name }}'
    - permission: FullControl
    - acetype: ALLOW
    - propagation: 'this folder, subfolders, and files'
  file.managed:
    - name: 'C:/salt/conf/minion.d/local_config.conf'
    - source: 'salt://saltstack/files/customizations.config.jinja'
    - template: jinja
    - defaults:
        execution_path: 'C:/salt'
    - context:
        execution_path: '{{ execution_path }}'




start the service:
  file.managed:
    - name: 'C:/salt/conf/minion'
    - source: 'salt://saltstack/files/minion.jinja'
    - template: jinja
    - defaults:
        execution_path: 'C:/salt'
    - context:
        execution_path: '{{ execution_path }}'
  service.running:
    - name: 'salt-minion'
