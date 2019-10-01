module.exports = {
  emptyLineBetweenGroups: false,
  aliases: {
    styles: './{filename}.scss',
  },
  importDevDependencies: true,
  importStatementFormatter: ({ importStatement }) => {
    return importStatement.replace(/;$/, '');
  },
  danglingCommas: true,
}
