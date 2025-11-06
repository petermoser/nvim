vim.g.dbs = {
	spotlight1 = "postgres://client_rw_app_user:"
		.. os.getenv("SPOTLIGHT1_DB_PASSWORD")
		.. "@ec2-3-218-111-210.compute-1.amazonaws.com:6432/spotlight1",
	spotlight2 = "postgres://client_rw_app_user:"
		.. os.getenv("SPOTLIGHT2_DB_PASSWORD")
		.. "@ec2-44-218-180-184.compute-1.amazonaws.com:6432/spotlight2",
	redshift2 = "postgres://mluser:"
		.. os.getenv("RW_ML_USER_REDSHIFT_DB_PASSWORD")
		.. "@coverstar2.473171555456.us-east-1.redshift-serverless.amazonaws.com:5439/active",
}

vim.g.db_ui_save_location = "~/Projects/norae/spotlight-backend/postgres/sql_statements/"
