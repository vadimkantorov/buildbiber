ROOT=$PWD
URLBIBER=https://github.com/plk/biber/archive/v2.15.tar.gz

PREFIX=$ROOT/build/native/prefix

#$PREFIX/bin/cpan -T Test::More Test::Differences File::Which    Module::Build    Config::AutoConf ExtUtils::LibBuilder    autovivification Class::Accessor Data::Dump Data::Compare Data::Uniqid DateTime::Format::Builder DateTime::Calendar::Julian File::Slurper IPC::Cmd IPC::Run3 List::AllUtils List::MoreUtils List::MoreUtils::XS Mozilla::CA Regexp::Common Log::Log4perl Unicode::Collate Unicode::Normalize Unicode::LineBreak Unicode::GCString Encode::Locale Encode::EUCJPASCII Encode::JIS2K Encode::HanExtra Parse::RecDescent PerlIO::utf8_strict XML::LibXML XML::LibXML::Simple XML::LibXSLT XML::Writer Sort::Key Storable Text::CSV Text::CSV_XS Text::Roman IO::String URI Text::BibTeX LWP::UserAgent LWP::Protocol::https Business::ISBN Business::ISSN Business::ISMN Lingua::Translit
#$PREFIX/bin/cpan -T PAR PAR::Packer

#mkdir -p source/biber
#wget $URLBIBER
#tar -xf $(basename $URLBIBER) --strip-components=1 --directory source/biber


platform='x86_64-linux'
platformsys='x86_64-linux-gnu'
perlv='5.30.0'

MODULESSYS="deprecate Pod::Simple::TranscodeSmart Pod::Simple::TranscodeDumb List::MoreUtils::XS List::SomeUtils::XS List::MoreUtils::PP HTTP::Status HTTP::Date Encode:: File::Find::Rule IO::Socket::SSL IO::String PerlIO::utf8_strict Text::CSV_XS DateTime"
MODULESBIBER="Biber::Input::file::bibtex Biber::Input::file::biblatexml Biber::Output::dot Biber::Output::bbl Biber::Output::bblxml Biber::Output::bibtex Biber::Output::biblatexml"
LIBSSYSROOT=/usr/lib/$platformsys
LIBSSYS="libxml2.so libz.so libxslt.so libexslt.so libssl.so.1.1 libcrypto.so.1.1"
LIBS="/usr/lib/libbtparse.so"
FILESBIBER="../data/biber-tool.conf;lib/Biber/biber-tool.conf ../data/schemata/config.rnc;lib/Biber/config.rnc ../data/schemata/config.rng;lib/Biber/config.rng ../data/schemata/bcf.rnc;lib/Biber/bcf.rnc ../data/schemata/bcf.rng;lib/Biber/bcf.rng ../data/bcf.xsl;Biber/bcf.xsl Biber/LaTeX/recode_data.xml;Biber/LaTeX/recode_data.xml"
FILESUNICODE="$PREFIX/lib/$perlv/Unicode/Collate/Locale;lib/Unicode/Collate/Locale $PREFIX/lib/$perlv/Unicode/Collate/CJK;lib/Unicode/Collate/CJK $PREFIX/lib/$perlv/Unicode/Collate/allkeys.txt;lib/Unicode/Collate/allkeys.txt $PREFIX/lib/$perlv/Unicode/Collate/keys.txt;lib/Unicode/Collate/keys.txt"
FILESSYS="$PREFIX/lib/site_perl/$perlv/Mozilla/CA/cacert.pem;lib/Mozilla/CA/cacert.pem $PREFIX/lib/$perlv/$platform/PerlIO;lib/PerlIO $PREFIX/lib/$perlv/$platform/auto/PerlIO;lib/auto/PerlIO $PREFIX/lib/site_perl/$perlv/Business/ISBN/RangeMessage.xml;lib/Business/ISBN/RangeMessage.xml"

cd source/biber/lib
PAR_VERBATIM=1 $PREFIX/bin/pp $(printf -- "--module %s " $MODULESSYS) $(printf -- "--module %s " $MODULESBIBER) $(printf -- "--link $LIBSSYSROOT/%s " $LIBSSYS) $(printf -- "--link %s " $LIBS) $(printf -- "--addfile %s " $FILESBIBER) $(printf -- "--addfile %s " $FILESUNICODE) $(printf -- "--addfile %s " $FILESSYS)  --unicode --cachedeps=scancache --output=$ROOT/biber.par ../bin/biber

#  --output=biber-linux_x86_64 \

