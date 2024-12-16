vim.g.dbs = {
	spotlight1 = "postgres://noraeinc:"
		.. os.getenv("SPOTLIGHT1_DB_PASSWORD")
		.. "@ec2-18-206-21-146.compute-1.amazonaws.com:6432/spotlight1",
	spotlight2 = "postgres://noraeinc:"
		.. os.getenv("SPOTLIGHT2_DB_PASSWORD")
		.. "@ec2-44-218-180-184.compute-1.amazonaws.com:6432/spotlight2",
}
