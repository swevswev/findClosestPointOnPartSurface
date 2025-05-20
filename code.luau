function getClosestPointOnPartSurface(hitbox, vec)
	local localPos = hitbox.CFrame:PointToObjectSpace(vec)
	local closestPoint = Vector3.new(0,0,0)
	local distX, distY, distZ = (hitbox.Size.X/2 - math.abs(localPos.X)), (hitbox.Size.Y/2 -math.abs(localPos.Y)), (hitbox.Size.Z/2 - math.abs(localPos.Z))
	if distX <= distY and distX <= distZ  then
		closestPoint = Vector3.new((math.sign(localPos.X) * hitbox.Size.X/2),math.clamp(localPos.Y, - hitbox.Size.Y/2, hitbox.Size.Y/2),math.clamp(localPos.Z, - hitbox.Size.Z/2, hitbox.Size.Z/2))
	elseif distY <= distX and distY <= distZ then
		closestPoint = Vector3.new(math.clamp(localPos.X, - hitbox.Size.X/2, hitbox.Size.X/2),(math.sign(localPos.Y) * hitbox.Size.Y/2),math.clamp(localPos.Z, - hitbox.Size.Z/2, hitbox.Size.Z/2))
	elseif distZ <= distX and distZ <= distY then
		closestPoint = Vector3.new(math.clamp(localPos.X, -hitbox.Size.X/2, hitbox.Size.X/2),math.clamp(localPos.Y, -hitbox.Size.Y/2, hitbox.Size.Y/2),(math.sign(localPos.Z) * hitbox.Size.Z/2))
	end
	return hitbox.CFrame:PointToWorldSpace(closestPoint)
end
