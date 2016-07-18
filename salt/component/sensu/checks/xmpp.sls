include:
  - component.sensu.client

check_xmpp:
  file.serialize:
    - name: /etc/sensu/conf.d/check_xmpp.json
    - dataset:
        checks:
          check_xmpp_terminal21:
            command: /usr/lib/nagios/plugins/check_jabber -H jabber.terminal21.de -e "from='terminal21.de'"
            interval: 120
            priority: major
            occurrences: 2
            subscribers:
              - satellite
    - formatter: JSON
    - watch_in:
      - service: sensu_client
