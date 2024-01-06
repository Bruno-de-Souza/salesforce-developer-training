public class Plants{
    public Boolean companionPlants(String plant1, String plant2) {
        Map<String, String> isCompanion = new Map<String, String>{
            'pepinos' => '',
                'onions' => 'alface',
                'cenouras' => 'cebolas',
                'tomatoes' => 'cebolas'
                };
                    return isCompanion.get(plant1) == plant2 ? true : isCompanion.get(plant2) == plant1 ? true : false;
    }
}