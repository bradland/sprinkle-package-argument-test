class AppConfig
  include Singleton

  def set(sym)
    @store ||= bucket(sym)
  end

  def get
    raise "AppConfig has no data" if @store.nil?
    @store
  end

  private

  # Fetches buckets of data from buckets/{bucket_name}.rb. These buckets should contain Ruby objects.
  def bucket(bucket_name, context = binding)
    path = "buckets/#{bucket_name.to_s}.rb"
    eval(File.new(path).read, context, File.basename(path))
  end

end
