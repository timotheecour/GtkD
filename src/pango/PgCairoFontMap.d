/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module pango.PgCairoFontMap;

private import cairo.ScaledFont;
private import glib.ConstructionException;
private import gobject.ObjectG;
private import gtkc.pango;
public  import gtkc.pangotypes;
private import pango.PgFontMap;


/** */
public class PgCairoFontMap : PgFontMap
{
	/** the main Gtk struct */
	protected PangoCairoFcFontMap* pangoCairoFcFontMap;

	/** Get the main Gtk struct */
	public PangoCairoFcFontMap* getPgCairoFontMapStruct()
	{
		return pangoCairoFcFontMap;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)pangoCairoFcFontMap;
	}

	protected override void setStruct(GObject* obj)
	{
		pangoCairoFcFontMap = cast(PangoCairoFcFontMap*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (PangoCairoFcFontMap* pangoCairoFcFontMap, bool ownedRef = false)
	{
		this.pangoCairoFcFontMap = pangoCairoFcFontMap;
		super(cast(PangoFontMap*)pangoCairoFcFontMap, ownedRef);
	}


	/**
	 * Gets the #cairo_scaled_font_t used by @font.
	 * The scaled font can be referenced and kept using
	 * cairo_scaled_font_reference().
	 *
	 * Return: the #cairo_scaled_font_t used by @font,
	 *     or %NULL if @font is %NULL.
	 *
	 * Since: 1.18
	 */
	public ScaledFont getScaledFont()
	{
		auto p = pango_cairo_font_get_scaled_font(cast(PangoCairoFont*)pangoCairoFcFontMap);
		
		if(p is null)
		{
			return null;
		}
		
		return new ScaledFont(cast(cairo_scaled_font_t*) p);
	}

	/**
	 * Gets a default #PangoCairoFontMap to use with Cairo.
	 *
	 * Note that the type of the returned object will depend
	 * on the particular font backend Cairo was compiled to use;
	 * You generally should only use the #PangoFontMap and
	 * #PangoCairoFontMap interfaces on the returned object.
	 *
	 * The default Cairo fontmap can be changed by using
	 * pango_cairo_font_map_set_default().  This can be used to
	 * change the Cairo font backend that the default fontmap
	 * uses for example.
	 *
	 * Note that since Pango 1.32.6, the default fontmap is per-thread.
	 * Each thread gets its own default fontmap.  In this way,
	 * PangoCairo can be used safely from multiple threads.
	 *
	 * Return: the default PangoCairo fontmap
	 *     for the current thread. This object is owned by Pango and must not be freed.
	 *
	 * Since: 1.10
	 */
	public static PgFontMap getDefault()
	{
		auto p = pango_cairo_font_map_get_default();
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(PgFontMap)(cast(PangoFontMap*) p);
	}

	/**
	 * Creates a new #PangoCairoFontMap object; a fontmap is used
	 * to cache information about available fonts, and holds
	 * certain global parameters such as the resolution.
	 * In most cases, you can use pango_cairo_font_map_get_default()
	 * instead.
	 *
	 * Note that the type of the returned object will depend
	 * on the particular font backend Cairo was compiled to use;
	 * You generally should only use the #PangoFontMap and
	 * #PangoCairoFontMap interfaces on the returned object.
	 *
	 * You can override the type of backend returned by using an
	 * environment variable %PANGOCAIRO_BACKEND.  Supported types,
	 * based on your build, are fc (fontconfig), win32, and coretext.
	 * If requested type is not available, NULL is returned. Ie.
	 * this is only useful for testing, when at least two backends
	 * are compiled in.
	 *
	 * Return: the newly allocated #PangoFontMap,
	 *     which should be freed with g_object_unref().
	 *
	 * Since: 1.10
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto p = pango_cairo_font_map_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(PangoCairoFcFontMap*) p, true);
	}

	/**
	 * Creates a new #PangoCairoFontMap object of the type suitable
	 * to be used with cairo font backend of type @fonttype.
	 *
	 * In most cases one should simply use @pango_cairo_font_map_new(),
	 * or in fact in most of those cases, just use
	 * @pango_cairo_font_map_get_default().
	 *
	 * Params:
	 *     fonttype = desired #cairo_font_type_t
	 *
	 * Return: the newly allocated
	 *     #PangoFontMap of suitable type which should be freed
	 *     with g_object_unref(), or %NULL if the requested
	 *     cairo font backend is not supported / compiled in.
	 *
	 * Since: 1.18
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(cairo_font_type_t fonttype)
	{
		auto p = pango_cairo_font_map_new_for_font_type(fonttype);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new_for_font_type");
		}
		
		this(cast(PangoCairoFcFontMap*) p, true);
	}

	/**
	 * Gets the type of Cairo font backend that @fontmap uses.
	 *
	 * Return: the #cairo_font_type_t cairo font backend type
	 *
	 * Since: 1.18
	 */
	public cairo_font_type_t getFontType()
	{
		return pango_cairo_font_map_get_font_type(cast(PangoCairoFontMap*)pangoCairoFcFontMap);
	}

	/**
	 * Gets the resolution for the fontmap. See pango_cairo_font_map_set_resolution()
	 *
	 * Return: the resolution in "dots per inch"
	 *
	 * Since: 1.10
	 */
	public double getResolution()
	{
		return pango_cairo_font_map_get_resolution(cast(PangoCairoFontMap*)pangoCairoFcFontMap);
	}

	/**
	 * Sets a default #PangoCairoFontMap to use with Cairo.
	 *
	 * This can be used to change the Cairo font backend that the
	 * default fontmap uses for example.  The old default font map
	 * is unreffed and the new font map referenced.
	 *
	 * Note that since Pango 1.32.6, the default fontmap is per-thread.
	 * This function only changes the default fontmap for
	 * the current thread.   Default fontmaps of exisiting threads
	 * are not changed.  Default fontmaps of any new threads will
	 * still be created using pango_cairo_font_map_new().
	 *
	 * A value of %NULL for @fontmap will cause the current default
	 * font map to be released and a new default font
	 * map to be created on demand, using pango_cairo_font_map_new().
	 *
	 * Since: 1.22
	 */
	public void setDefault()
	{
		pango_cairo_font_map_set_default(cast(PangoCairoFontMap*)pangoCairoFcFontMap);
	}

	/**
	 * Sets the resolution for the fontmap. This is a scale factor between
	 * points specified in a #PangoFontDescription and Cairo units. The
	 * default value is 96, meaning that a 10 point font will be 13
	 * units high. (10 * 96. / 72. = 13.3).
	 *
	 * Params:
	 *     dpi = the resolution in "dots per inch". (Physical inches aren't actually
	 *         involved; the terminology is conventional.)
	 *
	 * Since: 1.10
	 */
	public void setResolution(double dpi)
	{
		pango_cairo_font_map_set_resolution(cast(PangoCairoFontMap*)pangoCairoFcFontMap, dpi);
	}
}
