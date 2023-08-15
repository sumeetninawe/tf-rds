resource "aws_db_instance" "default" {
  allocated_storage = 10
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  identifier        = "mydb"
  username          = "dbuser"
  password          = "dbpassword"

  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.my_db_subnet_group.name

  backup_retention_period = 7         # Number of days to retain automated backups
  backup_window           = "03:00-04:00"   # Preferred UTC backup window (hh24:mi-hh24:mi format)
  
  maintenance_window      = "mon:04:00-mon:04:30"  # Preferred UTC maintenance window

  # Enable automated backups
  skip_final_snapshot = false
  final_snapshot_identifier = "my-db"
}