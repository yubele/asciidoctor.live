# Generate documents from asciidoc
guard 'shell' do
  watch(%r{^src/doc/.*.adoc$|^README.adoc$}) do |m|
    `bash bin/generate.sh #{m[0]}`
  end
end