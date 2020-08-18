# Generate documents from asciidoc
guard 'shell' do
  watch(%r{^src/doc/(.*).adoc$}) do |m|
    `bash src/provisioning/startup/asciidoctor/update.sh #{m[0]} doc/#{m[1]}`
  end
  watch(%r{^README.adoc$}) do |m|
    `bash src/provisioning/startup/asciidoctor/update.sh src/doc/index.adoc doc/index`
  end
  watch(%r{^README.adoc$}) do |m|
    `bash bin/revealjs README.adoc`
  end
  watch(%r{^src/doc/samples/(.*).adoc$}) do |m|
    `bash bin/revealjs src/doc/samples/#{m[1]}.adoc`
  end
end