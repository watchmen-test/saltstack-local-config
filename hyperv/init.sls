install hyper-v:
  dism.feature_installed:
    - name: 'Microsoft-Hyper-V'
    - enable_parent: True
    - restart: True
  cmd.script:
    - source: 'salt://hyperv/files/configure-net.ps1'
    - shell: 'powershell'
    - require:
      -  dism: 'Microsoft-Hyper-V'