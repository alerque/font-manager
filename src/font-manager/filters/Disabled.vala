/* Disabled.vala
 *
 * Copyright (C) 2009 - 2021 Jerry Casiano
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.
 *
 * If not, see <http://www.gnu.org/licenses/gpl-3.0.txt>.
*/

namespace FontManager {

    public class Disabled : Category {

        public Disabled () {
            base(_("Disabled"), _("Fonts which have been disabled"), "list-remove-symbolic", "%s;".printf(SELECT_FROM_FONTS), CategoryIndex.DISABLED);
        }

        public new async void update (StringSet reject) {
            SourceFunc callback = update.callback;
            base.update.begin((obj, res) => {
                base.update.end(res);
                families.retain_all(reject);
                Idle.add((owned) callback);
            });
            yield;
            return;
        }

    }

}
