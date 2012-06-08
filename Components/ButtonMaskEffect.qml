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

import QtQuick 1.0
import Qt.labs.shaders 1.0

ShaderEffectItem {
    property variant mask
    property variant base
    property variant gradient
    property real gradientStrength: 1.0

    fragmentShader:
        "
        #define Blend(base, blend, function) vec3(function(base.r, blend.r), function(base.g, blend.g), function(base.b, blend.b))

        #define BlendOverlayFloat(base, blend) (base < 0.5 ? (2.0 * base * blend) : (1.0 - 2.0 * (1.0 - base) * (1.0 - blend)))
        #define BlendOverlay(base, blend) Blend(base, blend, BlendOverlayFloat)

        varying highp vec2 qt_TexCoord0;
        uniform lowp float qt_Opacity;
        uniform sampler2D mask;
        uniform sampler2D base;
        uniform sampler2D gradient;
        uniform lowp float gradientStrength;

        void main(void)
        {
            lowp vec4 maskColor = texture2D(mask, qt_TexCoord0.st);

            if (maskColor.a != 0.0) {
                lowp vec4 baseColor = texture2D(base, qt_TexCoord0.st);
                if (gradientStrength != 0.0) {
                    lowp vec4 gradientColor = texture2D(gradient, qt_TexCoord0.st);
                    lowp vec4 result = vec4(BlendOverlay(baseColor, gradientColor), baseColor.a);
                    gl_FragColor = mix(baseColor, result, gradientStrength) * maskColor.a;
                } else {
                    gl_FragColor = baseColor * maskColor.a;
                }
            } else {
                gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
            }

        }
        "
}