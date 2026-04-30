# Force XeLaTeX (required for fontspec / Times New Roman)
$pdf_mode = 5;
$pdflatex = 'xelatex %O %S';

# Run makeglossaries automatically when glossary files change
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
    my ($base_name, $path) = fileparse($_[0]);
    pushd $path;
    my $return = system "makeglossaries", $base_name;
    popd;
    return $return;
}