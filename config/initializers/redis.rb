REDIS_CONF = YAML.load_file(File.join(Rails.root, "config/redis.yml"))[Rails.env]
$redis = Redis.new({
  host: REDIS_CONF["host"],
  role: REDIS_CONF["role"],
  logger: Logger.new(STDOUT),
  sentinels: REDIS_CONF["sentinels"].map { |sentinel|
    {
      host: sentinel["host"],
      port: sentinel["port"]
    }
  }
})
