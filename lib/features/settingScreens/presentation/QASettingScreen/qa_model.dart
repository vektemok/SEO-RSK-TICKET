List<Map<String, dynamic>> qaDescription = List.generate(
    7,
    (index) => {
          'id': index,
          'title': 'Item $index',
          'description':
              'This is the description of the item $index. Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          'isExpanded': false
        });
