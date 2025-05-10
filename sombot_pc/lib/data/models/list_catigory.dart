class ListCategory {
  final String name;
  final String imageUrl;

  ListCategory({
    required this.name,
    required this.imageUrl,
  });
}

List<ListCategory> item = [
  ListCategory(
      name: 'Laptop',
      imageUrl:
          'https://imgs.search.brave.com/qEeEOxgaNwpaUBX-zautkdeK98Jhq96dthmgFpgv2XA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pNS53/YWxtYXJ0aW1hZ2Vz/LmNvbS9zZW8vTVNJ/LUNyZWF0b3ItWjE2/LUhYLVN0dWRpby1B/MTNWRlRBLTA0NlVT/LUxhcHRvcC1JbnRl/bC1Db3JlLWk5LTEz/dGgtR2VuLTEzOTAw/SFgtMi0yMEdIei0z/MkdCLU1lbW9yeS0y/LVRCLVBDSWUtU1NE/LUdlRm9yY2UtUlRY/LTQwNjAtTGFwdG9w/LUdQVS0xNi0wLVRv/dWNfMTZmNjhlOTkt/ZTcxNy00YzM3LWJk/Y2UtMDNmOGMwZTY3/MGJjLjkxNjk4YTg5/YTVhZGYxNjFmOWJj/NmRhNDdiZDM4ZDYz/LmpwZWc_b2RuSGVp/Z2h0PTU4MCZvZG5X/aWR0aD01ODAmb2Ru/Qmc9RkZGRkZG'),
  ListCategory(
      name: 'Monitor',
      imageUrl:
          'https://imgs.search.brave.com/gfAbn_v0ikATNpwwrmnS6WCEFDq-VPLLb4QPj_GOaD0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9leHRl/cm5hbC1wcmV2aWV3/LnJlZGQuaXQvbW9u/aXRvci1tc2ktMjct/MjU2MHgxNDQwLTE2/NWh6LXZhLXBhbmVs/LTE2OS05OS1hdC1j/b3N0Y28tdjAtdGhh/ZEVkd01QeFllUzln/VDBhOTZNR1FLcVhn/dl9kMVNBUnotb3Fl/bWtGTS5qcGc_YXV0/bz13ZWJwJnM9OTMw/MzZhODU4NTljNzY5/OGFjMDE1OTJhYjA4/OGEyNDY2ZDM0YjE3/OQ'),
  ListCategory(
      name: 'Desktop',
      imageUrl:
          'https://imgs.search.brave.com/iQMu9NvGbYcgxMQ3KKY_hKXXaReFQsN9HqI8U3Y2Img/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9waXNj/ZXMuYmJ5c3RhdGlj/LmNvbS9pbWFnZTIv/QmVzdEJ1eV9VUy9H/YWxsZXJ5L1NPTC0x/MDYwNjUtTVNJX0Jy/YW5kVXBkYXRlLXNl/Y3Rpb24zX2ltZy0y/MTg3NzIuanBn'),
          ListCategory(
      name: 'Laptop',
      imageUrl:
          'https://imgs.search.brave.com/qEeEOxgaNwpaUBX-zautkdeK98Jhq96dthmgFpgv2XA/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pNS53/YWxtYXJ0aW1hZ2Vz/LmNvbS9zZW8vTVNJ/LUNyZWF0b3ItWjE2/LUhYLVN0dWRpby1B/MTNWRlRBLTA0NlVT/LUxhcHRvcC1JbnRl/bC1Db3JlLWk5LTEz/dGgtR2VuLTEzOTAw/SFgtMi0yMEdIei0z/MkdCLU1lbW9yeS0y/LVRCLVBDSWUtU1NE/LUdlRm9yY2UtUlRY/LTQwNjAtTGFwdG9w/LUdQVS0xNi0wLVRv/dWNfMTZmNjhlOTkt/ZTcxNy00YzM3LWJk/Y2UtMDNmOGMwZTY3/MGJjLjkxNjk4YTg5/YTVhZGYxNjFmOWJj/NmRhNDdiZDM4ZDYz/LmpwZWc_b2RuSGVp/Z2h0PTU4MCZvZG5X/aWR0aD01ODAmb2Ru/Qmc9RkZGRkZG'),
  ListCategory(
      name: 'Monitor',
      imageUrl:
          'https://imgs.search.brave.com/gfAbn_v0ikATNpwwrmnS6WCEFDq-VPLLb4QPj_GOaD0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9leHRl/cm5hbC1wcmV2aWV3/LnJlZGQuaXQvbW9u/aXRvci1tc2ktMjct/MjU2MHgxNDQwLTE2/NWh6LXZhLXBhbmVs/LTE2OS05OS1hdC1j/b3N0Y28tdjAtdGhh/ZEVkd01QeFllUzln/VDBhOTZNR1FLcVhn/dl9kMVNBUnotb3Fl/bWtGTS5qcGc_YXV0/bz13ZWJwJnM9OTMw/MzZhODU4NTljNzY5/OGFjMDE1OTJhYjA4/OGEyNDY2ZDM0YjE3/OQ'),
  ListCategory(
      name: 'Desktop',
      imageUrl:
          'https://imgs.search.brave.com/iQMu9NvGbYcgxMQ3KKY_hKXXaReFQsN9HqI8U3Y2Img/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9waXNj/ZXMuYmJ5c3RhdGlj/LmNvbS9pbWFnZTIv/QmVzdEJ1eV9VUy9H/YWxsZXJ5L1NPTC0x/MDYwNjUtTVNJX0Jy/YW5kVXBkYXRlLXNl/Y3Rpb24zX2ltZy0y/MTg3NzIuanBn'),
];
