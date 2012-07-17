class DataFile < ActiveRecord::Base
  def self.save(upload)
    name =  upload['datafile'].original_filename
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
    File.open(path).readlines.each do |linha|
      documento,nome = linha.split(/,/)
      Temp.create(:documento=>documento,:nome=>nome)
    end
  end
end
