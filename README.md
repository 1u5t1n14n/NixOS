## Secrets
All Secrets are passed into the rebuild-command using environment variables.
For the configuration to work properly, you have to export following variables
into the rebuild-command.

```bash
PAPERLESS   # passwd for Paperless Admin
PASSWD      # hashed passwd for main user
NEXTCLOUD   # passwd for Nextcloud Admin
KIAN        # hashed passwd for Kian (please use meme passwds or remove him)
CALIBRE     # passwd for Calibre-Web Admin !NOTCURRENTLY IMPLEMENTED
```
