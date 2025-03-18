// // ignore_for_file: avoid_print, camel_case_types, file_names

// import '../models/card.dart';

// class Card_Time {
//   String time;
//   int count;

//   Card_Time(this.count, this.time);
// }

// class DashboardRepository {
//   // theo năm
//   Future<List<Card_Time>> getCardCountEachYear(DateTime startTime, DateTime endTime) async {
//     Map<int, int> yearCardCount = {};


//     for (var card in cardsList) {
//       if (card.createdDate.isAfter(startTime) && card.createdDate.isBefore(endTime)) {
//         int year = card.createdDate.year;
//         yearCardCount[year] = (yearCardCount[year] ?? 0) + 1;
//       }
//     }
//     List<Card_Time> a = yearCardCount.entries
//         .map((entry) => Card_Time(entry.value, entry.key.toString()))
//         .toList();
//     print("getCardCountEachYear: ${a.length}" );

//     return yearCardCount.entries
//         .map((entry) => Card_Time(entry.value, entry.key.toString()))
//         .toList();
//   }

//   // thẻ theo tháng
//   Future<List<Card_Time>> getCardCountEachMonth(DateTime startTime, DateTime endTime) async {
//     Map<String, int> monthCardCount = {};

//     for (var card in cardsList) {
//       if (card.createdDate.isAfter(startTime) && card.createdDate.isBefore(endTime)) {
//         String monthKey = "${card.createdDate.year}-${card.createdDate.month}";
//         monthCardCount[monthKey] = (monthCardCount[monthKey] ?? 0) + 1;
//       }
//     }

//     return monthCardCount.entries
//         .map((entry) => Card_Time(entry.value, entry.key))
//         .toList();
//   }
//   DateTime startOfDay(DateTime date) {
//     return DateTime(date.year, date.month, date.day, 0, 0, 0);
//   }

//   DateTime endOfDay(DateTime date) {
//     return DateTime(date.year, date.month, date.day, 23, 59, 59);
//   }

//   // thẻ theo ngày
//   Future<List<Card_Time>> getCardCountEachDay(DateTime startTime, DateTime endTime) async {
//     startTime = startOfDay(startTime);
//     endTime = endOfDay(endTime);
//     Map<String, int> dayCardCount = {};
//     print(startTime);
//     print(endTime);

//     for (var card in MyCards) {
//       if (!card.createdDate.isBefore(startTime) && !card.createdDate.isAfter(endTime)) {
//         String dayKey = "${card.createdDate.year}-${card.createdDate.month}-${card.createdDate.day}";
//         dayCardCount[dayKey] = (dayCardCount[dayKey] ?? 0) + 1;
//       }
//     }
//     List<Card_Time> a = dayCardCount.entries
//         .map((entry) => Card_Time(entry.value, entry.key.toString()))
//         .toList();
//     print("getCardCountEachYear: ${a.length}" );

//     return dayCardCount.entries
//         .map((entry) => Card_Time(entry.value, entry.key))
//         .toList();
//   }
// }

