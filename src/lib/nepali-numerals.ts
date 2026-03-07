export function nepaliToEnglishNumerals(nepaliNumeralString: string): number {
  if (!nepaliNumeralString) return 0;
  
  const nepaliMap: { [key: string]: string } = {
    '०': '0',
    '१': '1',
    '२': '2',
    '३': '3',
    '४': '4',
    '५': '5',
    '६': '6',
    '७': '7',
    '८': '8',
    '९': '9',
  };

  // Replace commas and other formatting
  const cleanedStr = nepaliNumeralString.replace(/,/g, '');

  const englishNumeralString = cleanedStr
    .split('')
    .map((char) => nepaliMap[char] || char)
    .join('');

  return parseInt(englishNumeralString, 10) || 0;
}

export function formatNumberWithCommas(num: number): string {
  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
