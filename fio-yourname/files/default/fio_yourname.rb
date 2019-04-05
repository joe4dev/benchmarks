require 'cwb'

class FioYourname < Cwb::Benchmark
  def execute
    @cwb.submit_metric('cpu_model_name', timestamp, cpu_model_name) rescue nil
    result = `date`
    metric = extract(result)
    @cwb.submit_metric('current_time', timestamp, metric)
  end

  def timestamp
    Time.now.to_i
  end

  def cpu_model_name
    @cwb.deep_fetch('cpu', '0', 'model_name')
  end

  def extract(string)
    # Online regex tool: https://regexr.com/
    # string[/YOUR_REGEX_(WITH_CAPTURE)_GROUP/, 1]
    string[/(\d{2}:\d{2}:\d{2})/, 1]
  end
end
