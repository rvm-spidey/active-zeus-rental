import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: String
  }


  connect() {

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }

  #addMarkersToMap() {
    const marker =  JSON.parse(this.markersValue)
    const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

    const customMarker = document.createElement("div")
    customMarker.innerHTML = marker.marker_html

    new mapboxgl.Marker(customMarker)
      .setLngLat([ marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(this.map)
  }

  #fitMapToMarkers() {
    const marker =  JSON.parse(this.markersValue);
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([marker.lng, marker.lat ])
    this.map.fitBounds(bounds, { padding: 30, maxZoom: 13, duration: 1000 })
  }
}
