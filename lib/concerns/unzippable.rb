module Rbmnist::Unzippable

    def unzip_from_path(path)
        unzipped_enum = Zlib::GzipReader.new(File.open(path))
        unzipped_enum.each_byte.to_a
    end

end