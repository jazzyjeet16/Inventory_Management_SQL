# Backup and Restore

Run from a terminal with MySQL client utilities installed (replace credentials/host as appropriate):

```bash
mysqldump -u YOUR_USER -p --databases inventory_db > inventory_db_backup.sql
mysql -u YOUR_USER -p < inventory_db_backup.sql
```

Keep credentials out of GitHub. The backup file should be generated from the actual final database after all views/triggers/data have been verified. Do not commit secrets.
