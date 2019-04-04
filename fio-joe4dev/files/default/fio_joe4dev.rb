require 'cwb'

class FioJoe4dev < Cwb::Benchmark
  def execute
    @cwb.submit_metric('cpu_model_name', timestamp, cpu_model_name) rescue nil
    @cwb.submit_metric('fio_version', timestamp, `fio --version`)
    result = `fio seq-write.fio`
    metric = extract(result)
    @cwb.submit_metric('seq_write_bandwidth', timestamp, metric)
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
    string[/WRITE: bw=(\d+\.?\d*\wiB)/, 1]
  end
end
