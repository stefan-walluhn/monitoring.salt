include:
  - component.sensu.client
  - component.sensu.checks.debian
  - component.sensu.checks.erdenkinder
  - component.sensu.checks.gentoo
  - component.sensu.checks.influxdb
  - component.sensu.checks.mostusedsites
  - component.sensu.checks.network
  - component.sensu.checks.physical
  - component.sensu.checks.postfix
  - component.sensu.checks.rabbitmq
  - component.sensu.checks.system
  - component.sensu.checks.taiga
  - component.sensu.checks.test
  - component.sensu.checks.xmpp

sensu_server:
  service.running:
    - name: sensu-server
    - enable: True
    - watch:
      - service: sensu_client
