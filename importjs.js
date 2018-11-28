module.exports = {
  emptyLineBetweenGroups: false,
  aliases: {
    rx: 'rxjs/operators',
    styles: './{filename}.scss',
  },
  importDevDependencies: true,
  importStatementFormatter: ({ importStatement }) => {
    return importStatement.replace(/;$/, '');
  },
  danglingCommas: true,
}
