```console
sudo systemctl daemon-reload
sudo systemctl restart sample_server.service
sudo journalctl -u sample_server.service -f
```