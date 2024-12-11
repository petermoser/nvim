vim.g.dbs = {
	spotlight1 = "postgres://noraeinc:"
		.. os.getenv("SPOTLIGHT1_DB_PASSWORD")
		.. "@spotlight1.cznrc0u3ukot.us-east-1.rds.amazonaws.com/spotlight1",
	spotlight2 = "postgres://noraeinc:"
		.. os.getenv("SPOTLIGHT2_DB_PASSWORD")
		.. "@spotlight2.cznrc0u3ukot.us-east-1.rds.amazonaws.com/spotlight2",
}
