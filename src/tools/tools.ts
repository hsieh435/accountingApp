


// 金額三位一撇
export function formatCurrency(amount: number): string {
    return amount.toLocaleString("zh-TW", { style: "currency", currency: "TWD" });
}



// 陣列切割
export function sliceArray<T>(array: T[], currentPage: number = 1, dataPerpage: number = array.length): T[] {

  if (array.length === 0 || Array.isArray(array) === false) {
    return [];
  } else {
    for (let i = 0; i < array.length; i++) {
      array[i]["no"] = i + 1;
    }
    return array.slice((currentPage - 1) * dataPerpage, currentPage * dataPerpage);
  }

}
