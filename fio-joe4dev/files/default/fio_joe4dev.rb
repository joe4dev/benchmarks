require 'cwb'

class FioJoe4dev < Cwb::Benchmark
  def execute
    @cwb.submit_metric('cpu_model_name', timestamp, cpu_model_name) rescue nil
    @cwb.submit_metric('fio_version', timestamp, `fio --version`)
    repetitions.times { execute_run }
  end

  def execute_run
    result = `fio #{cli_options} seq-write.fio`
    metric = extract(result)
    @cwb.submit_metric('seq_write_bandwidth', timestamp, metric)
  end

  def timestamp
    Time.now.to_i
  end

  def cpu_model_name
    @cwb.deep_fetch('cpu', '0', 'model_name')
  end

  def repetitions
    @cwb.deep_fetch('fio', 'repetitions').to_i
  end

  def cli_options
    @cwb.deep_fetch('fio', 'cli_options')
  end

  def extract(string)
    # Online regex tool: https://regexr.com/
    # string[/YOUR_REGEX_(WITH_CAPTURE)_GROUP/, 1]
    string[/WRITE: bw=(\d+\.?\d*\wiB)/, 1]
  end
end
