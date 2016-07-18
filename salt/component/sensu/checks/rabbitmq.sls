include:
  - component.sensu.client

check_rabbitmq:
  file.serialize:
    - name: /etc/sensu/conf.d/check_rabbitmq.json
    - dataset:
        checks:
          check_rabbitmq_cert:
            command: check-ssl-cert.rb --pem /etc/rabbitmq/ssl/mq.crt -c 15 -w 30
            interval: 43200
            priority: informal
            subscribers:
              - rabbitmq
    - formatter: JSON
    - watch_in:
      - service: sensu_client
