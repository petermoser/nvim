vim.g.dbs = {
	spotlight1 = "postgres://client_rw_app_user:"
		.. os.getenv("SPOTLIGHT1_DB_PASSWORD")
		.. "@ec2-18-206-21-146.compute-1.amazonaws.com:6432/spotlight1",
	spotlight2 = "postgres://client_rw_app_user:"
		.. os.getenv("SPOTLIGHT2_DB_PASSWORD")
		.. "@ec2-44-218-180-184.compute-1.amazonaws.com:6432/spotlight2",
}

vim.g.db_ui_save_location = "~/Projects/norae/spotlight-backend/postgres/sql_statements/"
