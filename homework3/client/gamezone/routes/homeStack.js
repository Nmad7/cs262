import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';

import Header from '../shared/header';
import Home from '../screens/home';
import GameDetails from '../screens/gameDetails';

const Stack = createStackNavigator();
export default function HomeStack({ navigation }) {
    return (
        <Stack.Navigator screenOptions={{
            headerStyle: { backgroundColor: '#ddd' }
        }}>
            <Stack.Screen
                name="GameZone"
                component={Home}
                options={{
                    headerTitle: () => <Header navigation={navigation} />
                }}
            />
            <Stack.Screen
                name="GameDetails"
                component={GameDetails}
                options={{ title: 'Player Details' }}
            />
        </Stack.Navigator>
    );
};
