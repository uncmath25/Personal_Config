URL="127.0.0.1"
PORT="3306"
USER="root"
PASSWORD=$1
DB_NAME="DATABASE"
FORMATTED_DATE=`date +%Y_%m_%d`
BACKUP_PATH="/home/USER/backups/DATABASE/"$FORMATTED_DATE".sql"

mysqldump -h $URL -P $PORT -u $USER -p$PASSWORD $DB_NAME
echo "Exported "$DB_NAME" database to: "$BACKUP_PATH
