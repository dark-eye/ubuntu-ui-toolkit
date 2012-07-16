/*
 * Copyright 2012 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 1.1
import "../Components"
import "../Components/ListItems" as ListItem

Template {
    title: "List Items"

    Row {
        spacing: 20

        ListItem.Container {
            width: 250
            anchors {
                top: parent.top
                bottom: parent.bottom
            }
            ListItem.Header {
                text: "Selectable"
            }
            ListItem.Default {
                text: "Default"
                onClicked: selected = !selected
            }
            ListItem.SingleValue {
                text: "Single value"
                value: "Status"
                onClicked: selected = !selected
            }
            ListItem.MultiValue {
                text: "Multiple values"
                values: ["Value 1", "Value 2", "Value 3", "Value 4"]
                onClicked: selected = !selected
            }
            ListItem.Header { text: "With icons" }
            ListItem.Default {
                text: "Default"
                iconSource: "avatar_contacts_list.png"
                onClicked: selected = !selected
            }
            ListItem.SingleValue {
                text: "Single value"
                iconSource: "avatar_contacts_list.png"
                value: "Status"
                onClicked: selected = !selected
            }
            ListItem.MultiValue {
                text: "Multiple values"
                iconSource: "avatar_contacts_list.png"
                values: ["Value 1", "Value 2", "Value 3", "Value 4"]
                onClicked: selected = !selected
            }
            ListItem.Divider { }
            ListItem.SingleValue {
                text: "Disabled"
                iconSource: "avatar_contacts_list.png"
                value: "Status"
                enabled: false
            }
            ListItem.Divider { }
        } // Container

        ListItem.Container {
            width: 250
            anchors {
                top: parent.top
                bottom: parent.bottom
            }
            ListItem.Header {
                text: "Progression"
            }
            ListItem.Default {
                text: "Default"
                progression: true
            }
            ListItem.SingleValue {
                text: "Single value"
                value: "Status"
                progression: true
            }
            ListItem.MultiValue {
                text: "Multiple values"
                values: ["Value 1", "Value 2", "Value 3", "Value 4"]
                progression: true
            }
            ListItem.Header { text: "With icons" }
            ListItem.Default {
                text: "Default"
                iconSource: "avatar_contacts_list.png"
                progression: true
            }
            ListItem.SingleValue {
                text: "Single value"
                iconSource: "avatar_contacts_list.png"
                value: "Status"
                progression: true
            }
            ListItem.MultiValue {
                text: "Multiple values"
                iconSource: "avatar_contacts_list.png"
                values: ["Value 1", "Value 2", "Value 3", "Value 4"]
                progression: true
            }
            ListItem.Divider { }
            ListItem.MultiValue {
                text: "Disabled"
                iconSource: "avatar_contacts_list.png"
                values: ["Value 1", "Value 2", "Value 3", "Value 4"]
                progression: true
                enabled: false
            }
            ListItem.Divider { }
        } // Container
    }
} // window
